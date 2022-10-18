# chatbot-env-setup 

Deploy [Starburst Enterprise (SEP)](https://www.starburst.io/platform/starburst-enterprise/) to Openshift.

## Prerequisites:
- Strimzi Operator (tested on 0.23.0) OR Red Hat Openshift Streams for Apache Kafka
- Starburst Enterprise Helm Operator (tested on 354.0.0-ubi provided by Starburst Data) 
- Starburst Hive
- Postgres

### *Namespace and Operator Install*

    ansible-playbook /ansible-install/starburst-prequisites-ansible.yaml

Creates "starburst" namespace and applies Strimzi and Starburst Enterprise subscriptions. Otherwise, install from Openshift Console OperatorHub.

### *Trino CLI Installation*

1. download from https://docs.starburst.io/latest/installation/download.html#clients

2. Assuming _/usr/local/bin_ is on _$PATH_ environment variable:

    cd /usr/local/bin

    cp -p /home/<username>/Download/trino-cli-*-executable.jar .

    mv trino-cli-*-executable.jar trino

    chmod +x trino

3. Validate with _trino --version_ command

### *Install Go (for Postgres Operator Install - skip if you already have Go)*

1. Download from

    https://go.dev/doc/install

2. Add gopath to env:

    export GOPATH=$HOME/go

3. Validate with _go --version_

### *Install Postgres Operator in Starburst Namespace*

1. Clone Operator from Repository:

    git clone git@github.com:dev4devs-com/postgresql-operator.git $GOPATH/src/github.com/dev4devs-com/postgresql-operator

2. Update Role Binding for "Starburst Namespace":
Change the "Namespace" values in the Makefile and deploy/role_binding.yaml to point to your starburst namespace ("starburst" if using the defaults from this setup).

3. Install Operator on Openshift:

    cd $GOPATH/src/github.com/dev4devs-com/postgresql-operator

    make install

## Custom Resource YAML Files
This isn't the cleanest way for this to be done. Future solutions to follow....
- customize to your requirements

## Starburst license 
A license, provided by Starburst, yields additional features in the SEP environment. Once receiving your license file from Starburst, you need to create a secret containing the license file and reference the secret in your custom yaml file. 

The following [documentation](https://docs.starburst.io/356-e/k8s/sep-config-examples.html?highlight=license#adding-the-license-file) describes the process. 

## Deployment
Before getting started, edit the `.env` or create a `.env.local` file to customize your environment.

Use `make deploy` to deploy `customer-domain`, `finance-domain`, `kafka` (strimzi), `starburst-enterprise`, and `starburst-hive`.

You can deploy items individually using `make deploy-customer`, for example.
