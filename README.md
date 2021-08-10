# chatbot-env-setup 

Deploy [Starburst Enterprise (SEP)](https://www.starburst.io/platform/starburst-enterprise/) to Openshift.

## Prerequisites:
- Strimzi Operator (tested on 0.23.0) OR Red Hat Openshift Streams for Apache Kafka
- Starburst Enterprise Helm Operator (tested on 354.0.0-ubi provided by Starburst Data) 
- Starburst Hive
- Postgres

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
