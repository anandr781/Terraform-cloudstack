## Terraform-cloudstack
Terraform IaC for Apache Cloudstack 4.12

This project helps in codifying the network infrastructure and the instance provisioning . 

## Design Objectives
### Seperation of Scripts by concerns . 
Seperate TF scripts by rate of change (those that run once and those that run more than once) . For example, set up of VPC/Subnet happens one time, instance provisioning can happen a few times, but application deployments can happen numerous times . 

Scripts that are security related can also be seperated since they might have a different rate of change than provisioning. 

From Hashicorp : "When invoking any command that loads the Terraform configuration, Terraform loads all configuration files within the directory specified in alphabetical order."


============================================================================

# TERRAFORM 
Written in GoLang and very easy to install . 

### FILES
  * TF Executable
  * TF File - (.tf and .tfvars or any other .tf* it might spot in the executing directory )
  * TF State file
 
### COMPONENTS 
  * Variables - Seperates Code from actual values ,  helps as a placeholder , environment wise differing values (Dev/QA/Prod)
  * Provider - Target Technology or Platform Stack ("aws") 
  * Resource - Target Resource within that Provider that needs to be provisioned ("aws_instance") . 
      * connection 
      * provisioner (For example - "remote-exec
  * Output - Output emitted by Terraform as a result of a provisioning action. 
  
  ### OBJECTIVE - AUTOMATING DEPLOYMENT 
    | Provisioning Resources | Planning Updates | Use Source Control or IaC | Reusing Templates 
    
    
 
