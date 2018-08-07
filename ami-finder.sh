#!/usr/bin/env bash

regions=$(aws ec2 describe-regions --output text --query 'Regions[*].RegionName')
ecs_opt="/aws/service/ecs/optimized-ami/amazon-linux/recommended/image_id"

for region in $regions; do
    ami=$(aws ssm get-parameters --region $region --output text --names $ecs_opt --query Parameters[0].Value)
    echo -e "$region:\n\tECS: $ami"
done
