#!/usr/bin/env node

// Copyright 2019 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.



let base_entitlements = require(process.argv[2]);
let schema_entitlements = require(process.argv[3]);

for (let scope in schema_entitlements) {
    let base_list = base_entitlements[scope];
    let new_list = schema_entitlements[scope];
    if (base_list) {
        base_entitlements[scope] = base_list.concat(new_list);
        continue;
    }
    base_entitlements[scope] = new_list
}

console.log(JSON.stringify(base_entitlements, null, 2));