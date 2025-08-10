# GCP

## Table Of Contents

# GCP Concepts

## GCP VPC – Global Networking

- In contrast to **AWS Regional VCP**, **GCP** offers a **global VPC**, meaning a single **VPC** can exist across multiple regions. You do not need to create a brand-new VPC for each region. Instead, you create subnets in different regions, all within one global VPC.
- **Key Characteristics of GCP VPC**:

  1.  One VPC can span multiple regions
  2.  Subnets are assigned their own CIDR blocks within the same VPC
  3.  Cross-region communication happens natively within Google’s backbone
  4.  Lower inter-region transfer costs compared to AWS

- **Benefits of GCP’s Global Model**:
  1.  Easier Multi-Region Scaling – Add a subnet in a new region without creating a new VPC.
  2.  No Overlapping CIDR Issues within the same VPC.
  3.  No additional configuration needed for inter-region connectivity.
  4.  Single set of firewall rules and IAM-based policies across regions.

# Resources and Further Reading
