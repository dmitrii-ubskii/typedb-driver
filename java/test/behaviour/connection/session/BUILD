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
        "SessionSteps.java",
    ],
    visibility = ["//visibility:public"],
    deps = [
        # Internal Package Dependencies
        "//java/api:api",
        "//java/test/behaviour/connection:steps-base",

        # Internal Repository Dependencies
        "@vaticle_typeql//common/java:common",

        # External Maven Dependencies
        "@maven//:junit_junit",
        "@maven//:io_cucumber_cucumber_java",
    ],
)

typedb_behaviour_java_test(
    name = "test",
    srcs = [
        "SessionTest.java",
    ],
    test_class = "com.vaticle.typedb.driver.test.behaviour.connection.session.SessionTest",
    data = [
        "@vaticle_typedb_behaviour//connection:session.feature",
    ],
    connection_steps_core = "//java/test/behaviour/connection:steps-core",
    connection_steps_cloud = "//java/test/behaviour/connection:steps-cloud",
    steps = [
        ":steps",
        "//java/test/behaviour/connection/database:steps",
        "//java/test/behaviour/connection/transaction:steps",
        "//java/test/behaviour/query:steps",
    ],
    deps = [
        # Internal Package Dependencies
        "//java/test/behaviour:behaviour",

        # External dependencies from Maven
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
