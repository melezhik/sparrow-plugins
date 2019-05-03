# azure-storage-account

Create Azure storage account

# install

    $ s6 --install azure-storage-account

# usage

    # Create storage account in resource group
    $ sparrow plg run azure-storage-account \
    --param resource_group=$RG \
    --param name=$storage_account_name \
    --param sku_name=$sku_name
    --param location=$location

Example:


    $ sparrow plg run azure-storage-account \
      --param resource_group=SandBoxGroup \
      --param name=TrashBin \
      --param sku_name=Standard_LRS \
      --param location=centralus \

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


