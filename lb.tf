

# Creating Load Balancer
resource "aws_lb" "lb" {
  name               = "LB-Demo"
  internal           = false # It means it is internet facing
  load_balancer_type = "application"
  subnets = [
    for s in aws_subnet.pb_sn : s.id
  ]
  enable_deletion_protection = false
  security_groups            = [aws_security_group.SGLB.id]
  depends_on = [ aws_internet_gateway.internet_gateway ]
}

# Configuring ALB Listener
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = 80
  protocol          = "HTTP"


  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      status_code  = "200"
      # content = ""   # Commented this out because creating error, unnecessarily and asking for implementing, Lambda function to demonstrate custom content
    }
  }
}

# Creating Target Groups for Load Balancer
resource "aws_lb_target_group" "ec2" {
  name        = "EC2-Target-Group"
  port        = 80
  target_type = "instance"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main_vpc.id


  # Setting a health check for EC2, It might be different for other Target groups
  health_check {
    enabled             = true
    interval            = 30
    matcher             = "200-399" # It is like a Success code when we configure it in GUI
    path                = "/"
    port                = "traffic-port" # It is a Health Check Port, in GUI it is selected as traffic-port
    protocol            = "HTTP"         # A Health check protocol, which is selected as HTTP by default in GUI
    timeout             = 5              # The amount of time, in Seconds, during which no response means a failed health check
    unhealthy_threshold = 2              # The number of consecutive health check failures required before considering a target unhealthy

  }
}

# Creating Listener Rule to Forward Traffic to Target Groups
resource "aws_lb_listener_rule" "lb_listener_rule" {
  listener_arn = aws_lb_listener.alb_listener.arn
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ec2.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
}