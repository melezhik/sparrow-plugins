sudo dnf update -y
sudo dnf list postgresql-server
sudo dnf install -y postgresql-server postgresql
sudo systemctl enable postgresql
sudo postgresql-setup --initdb 2>&1
sudo systemctl start postgresql
sudo systemctl status postgresql
