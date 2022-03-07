resource "aws_security_group" "allow_all_from_intranet" {
  name        = "allow_all_from_intranet"
  description = "Allow All from intranet"
  vpc_id      = data.aws_vpc.main.id

  tags = {
    Name = "All Inbound From Intranet (${local.vpc_name})"
  }
}

resource "aws_security_group_rule" "allow_all_from_intranet" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = local.intranet_cidr_blocks
  security_group_id = aws_security_group.allow_all_from_intranet.id
}

resource "aws_security_group" "allow_from_intranet" {
  count       = length(local.intersection)
  name        = "allow_${lower(local.intersection[count.index])}"
  description = "Allow ${local.intersection[count.index]}"
  vpc_id      = data.aws_vpc.main.id

  tags = {
    Name = "Inbound ${local.intersection[count.index]}"
  }
}

resource "aws_security_group_rule" "allow_from_intranet" {
  for_each = {
    for name, def in local.group_ports : def.key => def
    if contains(local.intersection, def.name)
  }

  description       = each.value.name
  type              = "ingress"
  from_port         = each.value.port
  to_port           = each.value.port
  protocol          = "tcp"
  cidr_blocks       = local.intranet_cidr_blocks
  security_group_id = aws_security_group.allow_from_intranet[index(local.intersection, each.value.name)].id
}