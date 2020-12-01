provider "aws" {
  alias = "intersite"
}

provider "aws" {
  alias = "environment"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "transit_gateway_attachment" {
  provider = aws.environment

  subnet_ids         = var.subnet_ids
  transit_gateway_id = var.transit_gateway_id
  vpc_id             = var.vpc_id

  tags = {
    Name        = var.name
    Terraform   = "true"
    Environment = var.environment
    Account     = var.account
    CreatedBy   = var.created_by
    Owner       = var.owner
    CostCentre  = var.cost_centre
  }

}

resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "accept_tgw_attachment_in_intersite" {
  provider                      = aws.intersite
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment.id

  tags = {
    Name        = var.name
    Terraform   = "true"
    Environment = var.environment
    Account     = var.account
    CreatedBy   = var.created_by
    Owner       = var.owner
    CostCentre  = var.cost_centre
  }
}

