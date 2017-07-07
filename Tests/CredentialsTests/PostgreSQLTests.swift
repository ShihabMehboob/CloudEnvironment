/*
 * Copyright IBM Corporation 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import XCTest
import Configuration
@testable import Credentials
@testable import CloudEnvironment

class PostgreSQLTests: XCTestCase {

    static var allTests : [(String, (PostgreSQLTests) -> () throws -> Void)] {
        return [
            ("testGetCredentials", testGetCredentials),
        ]
    }

    func testGetCredentials() {

        // Load test mappings.json file and Cloud Foundry test credentials-- VCAP_SERVICES and VCAP_APPLICATION
        let cloudEnv = CloudEnv(mappingsFilePath: "Tests/CredentialsTests/resources", cloudFoundryFile: "Tests/CredentialsTests/resources/config_cf_example.json")

        guard let credentials =  cloudEnv.getPostgreSQLCredentials(name: "PostgreSQLKey") else {
            XCTFail("Could not load PostgreSQL credentials.")
            return
        }

        XCTAssertEqual(credentials.host, "bluemix-sandbox-dal-9-portal.0.dblayer.com", "PostgreSQL service host should match.")
        XCTAssertEqual(credentials.username, "user", "Object Storage service username should match.")
        XCTAssertEqual(credentials.password, "password", "Object Storage service password should match.")
        XCTAssertEqual(credentials.port, 22387, "Object Storage service port should match.")

    }

}
