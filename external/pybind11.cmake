# Copyright 2020-2025 Jij Inc.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

INCLUDE (FetchContent)

MESSAGE (CHECK_START "Fetching Pybind11")
LIST (APPEND CMAKE_MESSAGE_INDENT "  ")

SET (FETCHCONTENT_QUIET OFF)
#### pybind11 ####
FETCHCONTENT_DECLARE (
        pybind11
        GIT_REPOSITORY https://github.com/pybind/pybind11
        GIT_TAG v3.0.1
        GIT_SHALLOW TRUE
)
SET (BUILD_TESTING OFF)

# Prevent pybind11 from being installed by using FetchContent_Populate + add_subdirectory with EXCLUDE_FROM_ALL
FETCHCONTENT_GETPROPERTIES(pybind11)
IF(NOT pybind11_POPULATED)
    FETCHCONTENT_POPULATE(pybind11)
    ADD_SUBDIRECTORY(${pybind11_SOURCE_DIR} ${pybind11_BINARY_DIR} EXCLUDE_FROM_ALL)
ENDIF()

LIST (POP_BACK CMAKE_MESSAGE_INDENT)
MESSAGE (CHECK_PASS "fetched")
