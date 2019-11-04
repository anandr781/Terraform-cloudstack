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
    
    
 
