# devops-netology

##моя работа в git
еще несколько слов добавила


##Terraform.gitignore
будут игнорироваться
+ локальные директории .terraform
  > \*\*/.terraform/*
+ файлы, оканчивающиеся на
  > \*.tfstate
                             
  > \*.tfstate.\*
  
  > \*.tfvars
  
  > override.tf
  
  > override.tf.json
  
  > \*_override.tf
  
  > \*_override.tf.json
+ конфигурационные файлы
  > \.terraformrc
                           
  > terraform.rc
+ краш лог файлы
  > crash.log
