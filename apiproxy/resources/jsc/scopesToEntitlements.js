var entitlements_map = JSON.parse(context.getVariable("graphql_entitlements_map"));
var scopes = context.getVariable("scope");

var scopes_array = scopes.split(' ');

var entitlements = ['query.__schema.**']; //seeded with instrospection entitlement

scopes_array.forEach(function(scope) {
    if (entitlements_map[scope]) {
        entitlements.push(entitlements_map[scope].join(' '));
    }
});


context.setVariable("entitlements", entitlements.join(' '));


