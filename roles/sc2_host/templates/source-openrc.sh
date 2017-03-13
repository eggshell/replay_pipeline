<#
.Synopsis
   Source an OpenStack OpenRC file.
.DESCRIPTION
   This script allows you to source an OpenRC file that can be downloaded from the
   OpenStack dashboard. After running the script you'll be able to use the OpenStack
   command-line tools. These need to be installed separately.
.PARAMETER LiteralPath
   The OpenRC file you downloaded from the OpenStack dashboard.
.EXAMPLE
   Source-OpenRC H:\project-openrc.sh
.LINK
   http://openstack.naturalis.nl
#>

If ($args.count -lt 1) {
    Write "Please provide an OpenRC file as argument."
    Exit
}

ElseIf ($args.count -gt 1) {
    Write "Please provide a single OpenRC file as argument."
    Exit
}

ElseIf (-Not (Test-Path $args[0])) {
    Write "The OpenRC file you specified doesn't exist!"
    Exit
}
Else {
    $openrc = $args[0]
    $error = "The file you specified doesn't seem to be a valid OpenRC file"

    # With the addition of Keystone, to use an openstack cloud you should
    # authenticate against keystone, which returns a **Token** and **Service
    # Catalog**.  The catalog contains the endpoint for all services the
    # user/tenant has access to - including nova, glance, keystone, swift.
    #
    # *NOTE*: Using the 2.0 *auth api* does not mean that compute api is 2.0.  We
    # will use the 1.1 *compute api*
    $os_project_name = Select-String -Path $openrc -Pattern 'OS_PROJECT_NAME'
    If ($os_project_name) {
        $env:OS_PROJECT_NAME = ([string]($os_project_name)).Split("=")[1].Replace("`"","")
    }
    Else {
        Write $error
        Exit
    }

    # With the addition of Keystone we have standardized on the term **tenant**
    # as the entity that owns the resources.
    $os_project_id = Select-String -Path $openrc -Pattern 'OS_PROJECT_ID'
    If ($os_project_id) {
        $env:OS_PROJECT_ID = ([string]($os_project_id)).Split("=")[1].Replace("`"","")
    }
    Else {
        Write $error
        Exit
    }

    $os_project_name = Select-String -Path $openrc -Pattern 'OS_PROJECT_NAME'
    If ($os_project_name) {
        $env:OS_PROJECT_NAME = ([string]($os_project_name)).Split("=")[1].Replace("`"","")
    }
    Else {
        Write $error
        Exit
    }

    $os_auth_url = Select-String -Path $openrc -Pattern 'OS_AUTH_URL'
    If ($os_auth_url) {
        $env:OS_AUTH_URL = ([string]($os_auth_url)).Split("=")[1].Replace("`"","")
    }
    Else {
        Write $error
        Exit
    }

    # In addition to the owning entity (tenant), openstack stores the entity
    # performing the action as the **user**.
    $os_user_id = Select-String -Path $openrc -Pattern 'OS_USER_ID'
    If ($os_user_id) {
        $env:OS_USER_ID = ([string]($os_user_id)).Split("=")[1].Replace("`"","")
    }
    Else {
        Write $error
        Exit
    }

    # With Keystone you pass the keystone password.
    $os_password = Select-String -Path $openrc -Pattern 'OS_PASSWORD'
    If ($os_password) {
        $env:OS_PASSWORD = ([string]($os_password)).Split("=")[1].Replace("`"","")
    }
    Else {
        Write $error
        Exit
    }

    $os_region_name = Select-String -Path $openrc -Pattern 'OS_REGION_NAME'
    If ($os_region_name) {
        $env:OS_REGION_NAME = ([string]($os_region_name)).Split("=")[1].Replace("`"","")
    }
    Else {
        Write $error
        Exit
    }

    $os_identity_api_version = Select-String -Path $openrc -Pattern 'OS_IDENTITY_API_VERSION'
    If ($os_identity_api_version) {
        $env:OS_IDENTITY_API_VERSION = ([string]($os_identity_api_version)).Split("=")[1].Replace("`"","")
    }
    Else {
        Write $error
        Exit
    }

    $os_auth_version = Select-String -Path $openrc -Pattern 'OS_AUTH_VERSION'
    If ($os_identity_api_version) {
        $env:OS_AUTH_VERSION = ([string]($os_auth_version)).Split("=")[1].Replace("`"","")
    }
    Else {
        Write $error
        Exit
    }
}
