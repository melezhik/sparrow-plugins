# azure-app-service-plan

Update Azure app service plan 

# install

    $ s6 --install azure-app-service-plan

# usage

    # set SKU size
    $ sparrow plg run azure-app-service-plan \
    --param resource_group=$RG \
    --param app_service_plan=$AppServicePlanName \
    --param size=Medium \
    --param workers_num=5

# parameters

## context

Azure context for authentication

## resource_group

Azure resource group

## app_service_plan

Azure app service plan name

## size


Size ( e.g `Small|Medium|Large` )

## workers_num

Number of workers ( aka capacity )

# Requirements

Powershell

# author

Alexey Melezhik


