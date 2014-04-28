# Vagrant + Chef + Rails + PostgreSQL + rvm + bower

Basic setup for a rails application through vagrant. Includes basic configuration in order to run buzzstarter-training project.

# Get up and running

## 1. Install VirtualBox
https://www.virtualbox.org/

## 2. Install Vagrant
https://www.vagrantup.com/

## 3. Install librarian-chef gem
``
  $ gem install librarian-chef 
``

## 4. Install chef cookbooks
``
  $ librarian-chef install
``

## 5. Build the VM
``
  $ vagrant up
``

# Usage

There's a folder called 'app' in this directory, it will be mounted into the VM at "/var/www". This is where the rails app should be cloned. Since this folder is shared between the two environments you can edit code from your host OS and run rails commands (etc) from within the VM.

To login to the VM run:

``
  $ vagrant ssh
``

When you are done, exit the VM and run the following command to suspend it until later.

``
  $ vagrant suspend
``

Resume work at anytime:

``
  $ vagrant up
``
