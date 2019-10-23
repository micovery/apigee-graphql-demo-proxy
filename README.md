## Apigee GraphQL Demo Proxy


### Description

This repo contains an Apigee API Proxy that is meant to be used with the [Apigee GraphQL Demo](https://github.com/micovery/apigee-graphql-demo).
The repo makes use of both the [Apigee maven deploy plugin](https://github.com/apigee/apigee-deploy-maven-plugin) and the [Apigee maven config plugin](https://github.com/apigee/apigee-config-maven-plugin).


### How it works

This API Proxy shows how to protect an existing GraphQL endpoint with fine-grained OAuth scopes using Apigee Edge.

For the purpose of this demo, you can use the [apigee-graphql-demo-server](https://github.com/micovery/apigee-graphql-demo-server)
to deploy a sample GraphQL server.


### Prerequisites

 * Deploy the demo [apigee-graphql-demo-server](https://github.com/micovery/apigee-graphql-demo-server) application.

    
### How to deploy it 

To deploy the API proxy and its config assets run the following command:

```bash
    mvn -ntp install \
        -Ptest \
        -Dtarget_backend=${TARGET_BACKEND_GRAPHQL_SERVER} \
        -Dapigee.username=${APIGEE_USERNAME} \
        -Dapigee.password=${APIGEE_PASSWORD} \
        -Dapigee.org=${APIGEE_ORG} \
        -Dapigee.env=${APIGEE_ENV}
```
    
This will deploy the `graphql-proxy` API Proxy, and its configuration assets to the specified $APIGEE_ORG organization under the `test` environment.


### Assets
In addition to the `graphql-proxy` itself, the following assets will be created in your Apigee organization:

* **KVM(s)**
    * **graphql**
    
        This key-value-map contains:
        * `target_backend`
            
            This is the URL of the target backend GraphQL server that is being proxied.
        * `entitlements_map_json`
            
            This is a JSON object containing the mapping of OAuth scopes to to GraphQL entitlements. 
            The source file for the entitlements map is under [./resources/files](/resources/files/).

## Not Google Product Clause

This is not an officially supported Google product.
