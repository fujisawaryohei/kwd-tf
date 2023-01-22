resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "ingress_rules" {
  for_each = {
    for index, rule in lookup(var.sg.ingress_rules, "rules"): index => {
      from_port   = rule.from_port
      to_port     = rule.to_port
      protocol    = rule.protocol
      cidr_blocks = rule.cidr_blocks
    }
  }
  security_group_id = aws_security_group.sg.id
  type              = lookup(var.sg.ingress_rules, "type")
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
}

resource "aws_security_group_rule" "egress_rules" {
  for_each = {
    for index, rule in lookup(var.sg.egress_rules, "rules"): index => {
      from_port   = rule.from_port
      to_port     = rule.to_port
      protocol    = rule.protocol
      cidr_blocks = rule.cidr_blocks
    }
  }
  security_group_id = aws_security_group.sg.id
  type              = lookup(var.sg.egress_rules, "type")
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
}