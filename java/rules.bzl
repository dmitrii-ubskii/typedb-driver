#
# Copyright (C) 2022 Vaticle
#
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
#

load("@vaticle_dependencies//builder/swig:java.bzl", "swig_java")

def platform_specific_swig_java(name, platforms, maven_coordinates, tags=[], **kwargs):
    for platform in platforms.values():
        swig_java(
            name = name + "-" + platform,
            tags = tags + ["maven_coordinates=" + maven_coordinates.replace("{platform}", platform)],
            **kwargs,
        )
    native.alias(
        name = name,
        actual = select({config: name + "-" + platform for config, platform in platforms.items()})
    )
