## Terraform-cloudstack
Terraform IaC for Apache Cloudstack 4.12

This project helps in codifying the network infrastructure and the instance provisioning . 

### Design Objectives
### Seperation of Scripts by concerns : 
Seperate TF scripts by __rate of change__ (those that run once and those that run more than once) . For example, set up of VPC/Subnet happens one time, instance provisioning can happen a few times, but application deployments can happen numerous times . 

Scripts that are security related can also be seperated since they might have a different rate of change than provisioning. 




==================================================================================

# TERRAFORM 
Written in GoLang and very easy to install . 

### FILES
   * TF Executable
   * TF File - (.tf and .tfvars or any other .tf* it might spot in the executing directory )
   * TF State file
 
   For Load order Hashicorp states : "When invoking any command that loads the Terraform configuration, Terraform loads all configuration files within the directory specified in alphabetical order."
 
### COMPONENTS 
   * __Variables__ - Seperates Code from actual values ,  helps as a placeholder , environment wise differing values (Dev/QA/Prod)
   * __Provider__ - Target Technology or Platform Stack ("aws") 
   * __Resource__ - Target Resource within that Provider that needs to be provisioned ("aws_instance") . 
       * connection 
       * provisioner (For example - "remote-exec
   * __Output__ - Output emitted by Terraform as a result of a provisioning action. 
   * __Data__ - Data performs metadata lookups on provisioners (For ex., "aws_availability_zones" for AWS provider) 
### Terraform Configuration File (.terraformrc file)
  [Details](https://www.terraform.io/docs/commands/cli-config.html)
  
  ### OBJECTIVE - AUTOMATING DEPLOYMENT 
    | Provisioning Resources | Planning Updates | Use Source Control or IaC | Reusing Templates 
    
----------------------------------------------------------------------------------------------------------------------------

## I. Planning Updates
  ### I.i.Terraform State File 
  * JSON Format (Do not edit the file ever) 
  * Within the file - __resource mappings and metadata__ 
  * Represents a __Resource Tree / Dependency Tree__ (this helps TF orchestrate across providers) - For ex., A DNS address of a ALB is available only after AWS creates the resource during execution and these kind of run-time info gets persisted in state file.
  * This __Resource Tree__ enables TF to work across muliple providers. 
  * Making updates to configuration - State file gets __locked__ , very useful when multiple people or process (like Jenkins) on the same infrastructure and when the __stated is stored remotely__.
  * State is stored locally or __remotely (ex., NFS, Consul , S3 bucket)__ . As long as all process/people working with the state can reach the location it should be fine. 
  
 ### I.ii. Terraform Planning 
 * Inspects Terraform state - What is the current state of the enviroment. It might refresh the state as needed. 
 * Based on what is already configured, what is configuration submitted looking at these it builds a __Dependency Graph__ aka __Dependency Tree__ (For ex., subnet needs to be created only after VPC) . 
 * It will determine additions and deletions and presents that info back to the user .
 * Terraform then "walks the line" as per the plan that was displayed .
 
    
 
