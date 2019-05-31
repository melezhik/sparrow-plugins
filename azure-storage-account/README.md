# azure-storage-account

Create Azure storage account

# install

    $ s6 --install azure-storage-account

# usage

    # Create storage account in resource group
    $ s6 --plg-run azure-storage-account@\
    ,resource_group=$RG\
    ,name=$storage_account_name\
    ,sku_name=$sku_name
    ,location=$location

Example:


    $ s6 --plg-run azure-storage-account@\
    ,resource_group=SandBoxGroup\
    ,name=TrashBin\
    ,sku_name=Standard_LRS\
    ,location=centralus\

# parameters

## context

Azure context for authentication

## resource_group

Azure resource group

## name

Storage account name

## sku_name

Storage SKU name

## location

Storage account location

# Requirements

Powershell

# author

Alexey Melezhik


