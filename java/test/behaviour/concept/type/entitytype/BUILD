# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

package(default_visibility = ["//java/test/behaviour:__subpackages__"])
load("@vaticle_dependencies//tool/checkstyle:rules.bzl", "checkstyle_test")
load("//java/test/behaviour:rules.bzl", "typedb_behaviour_java_test")

java_library(
    name = "steps",
    srcs = [
        "EntityTypeSteps.java"
    ],
    deps = [
    ],
    visibility = ["//visibility:public"],
)

typedb_behaviour_java_test(
    name = "test",
    srcs = [
        "EntityTypeTest.java"
    ],
    test_class = "com.vaticle.typedb.driver.test.behaviour.concept.type.entitytype.EntityTypeTest",
    data = [
        "@vaticle_typedb_behaviour//concept/type:entitytype.feature",
    ],
    connection_steps_core = "//java/test/behaviour/connection:steps-core",
    connection_steps_cloud = "//java/test/behaviour/connection:steps-cloud",
    steps = [
        ":steps",
        "//java/test/behaviour/concept/thing/entity:steps",
        "//java/test/behaviour/concept/thing/attribute:steps",
        "//java/test/behaviour/concept/thing/relation:steps",
        "//java/test/behaviour/concept/type/attributetype:steps",
        "//java/test/behaviour/concept/type/relationtype:steps",
        "//java/test/behaviour/concept/type/thingtype:steps",
        "//java/test/behaviour/connection/database:steps",
        "//java/test/behaviour/connection/session:steps",
        "//java/test/behaviour/connection/transaction:steps",
    ],
    deps = [
        # Internal Package Dependencies
        "//java/test/behaviour:behaviour",

        # External Maven Dependencies
        "@maven//:io_cucumber_cucumber_junit",
    ],
    runtime_deps = [
        "//java/test/behaviour/config:parameters",
    ],
    size = "large",
)

checkstyle_test(
    name = "checkstyle",
    include = glob(["*"]),
    license_type = "apache-header",
)
