pipeline {
  agent any

  parameters {
    string(name: 'aws_region', defaultValue: 'us-east-1', description: 'AWS region')
    string(name: 'vpc_cidr_block', defaultValue: '10.0.0.0/16', description: 'VPC CIDR block')

    string(name: 'key_name', defaultValue: 'your-keypair-name', description: 'EC2 Key Pair Name')
    string(name: 'private_key_path', defaultValue: '/path/to/your/key.pem', description: 'Private Key Path')

    string(name: 'ami', defaultValue: 'ami-xxxxxxxxxxxxxxxxx', description: 'AMI ID')
    string(name: 'instance_type', defaultValue: 't2.micro', description: 'EC2 instance type')

    string(name: 'db_instance_class', defaultValue: 'db.t4g.micro', description: 'RDS DB instance class')
    string(name: 'db_engine', defaultValue: 'mysql', description: 'RDS DB engine')
    string(name: 'db_engine_version', defaultValue: '8.0', description: 'RDS DB engine version')

    string(name: 'db_admin_user', defaultValue: 'admin', description: 'DB admin username')
    string(name: 'db_admin_password', defaultValue: 'CHANGE_ME_DB_PASSWORD', description: 'DB admin password')

    string(name: 'wp_db_name', defaultValue: 'wordpress-database', description: 'WordPress DB name')
    string(name: 'wp_db_user', defaultValue: 'wp_user', description: 'WordPress DB user')
    string(name: 'wp_db_password', defaultValue: 'CHANGE_ME_WP_PASSWORD', description: 'WordPress DB password')

    string(name: 'wp_site_title', defaultValue: "My WordPress Site", description: 'WP Site Title')
    string(name: 'wp_admin_user', defaultValue: 'admin', description: 'WP Admin Username')
    string(name: 'wp_admin_password', defaultValue: 'CHANGE_ME_WP_ADMIN_PASS', description: 'WP Admin Password')
    string(name: 'wp_admin_email', defaultValue: 'admin@example.com', description: 'WP Admin Email')

    string(name: 'ansible_dir', defaultValue: '/path/to/your/ansible', description: 'Ansible directory')
  }

  environment {
    AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
    AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
  }

  stages {
    stage('Generate terraform.tfvars') {
      steps {
        dir('/path/to/terraform/project') {
          writeFile file: 'terraform.tfvars', text: """
aws_region        = "${params.aws_region}"
vpc_cidr_block    = "${params.vpc_cidr_block}"

key_name          = "${params.key_name}"
private_key_path  = "${params.private_key_path}"

ami               = "${params.ami}"
instance_type     = "${params.instance_type}"

db_instance_class = "${params.db_instance_class}"
db_engine         = "${params.db_engine}"
db_engine_version = "${params.db_engine_version}"

db_admin_user     = "${params.db_admin_user}"
db_admin_password = "${params.db_admin_password}"

wp_db_name        = "${params.wp_db_name}"
wp_db_user        = "${params.wp_db_user}"
wp_db_password    = "${params.wp_db_password}"

wp_site_title     = "${params.wp_site_title}"
wp_admin_user     = "${params.wp_admin_user}"
wp_admin_password = "${params.wp_admin_password}"
wp_admin_email    = "${params.wp_admin_email}"

ansible_dir       = "${params.ansible_dir}"
"""
        }
      }
    }

    stage('Terraform Init') {
      steps {
        dir('/path/to/terraform/project') {
          sh 'terraform init'
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        dir('/path/to/terraform/project') {
          sh 'terraform apply -var-file="terraform.tfvars" -auto-approve'
        }
      }
    }

    stage('Run Ansible Playbook') {
      when {
        expression { currentBuild.currentResult == 'SUCCESS' }
      }
      steps {
        echo 'Terraform apply completed successfully.'
        dir("${params.ansible_dir}") {
          sh "ansible-playbook -i hosts site.yml --ssh-extra-args='-o StrictHostKeyChecking=no'"
        }
      }
    }
  }

  post {
    failure {
      echo 'Terraform apply failed.'
    }
  }
}
