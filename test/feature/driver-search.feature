Feature: Search name driver
    As an operator,
    I want to search name customer.

    Background:
    # 1: asc tang > giam ; -1: desc giam > tang
    Scenario: 01. Operator search driver by name
        # Search default, sort by registration date
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                 |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
            | {"total": 18, "list":[{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d41634c49050a52af4b3e8f"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d3e596046694d6a60b712d2"},{"userId":"5d8c152f9d9d7d4194d8d704"},{"userId":"5d8c15599d9d7d4194d8d706"},{"userId":"5d8c15959d9d7d4194d8d708"}]} |

        # Search by name no input data
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                               |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"desc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                               |
            | {"from":0,"size":10,"total": 18, "list":[{"userId":"5d8c15959d9d7d4194d8d708"},{"userId":"5d8c15599d9d7d4194d8d706"},{"userId":"5d8c152f9d9d7d4194d8d704"},{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a54128ea2287534f949f3"}]} |

        # Search name is characters
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                                    |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"nghia","searchBy":"fullNameSort"},"sort":{"createdDate":"desc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
            | {"total": 8, "list":[{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d8c15959d9d7d4194d8d708"}]} |

        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                    |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"CAD","searchBy":"fullNameSort"}} |

        Then I should get the response data matches with
            | response                                                     |
            | {"total": 1, "list":[{"userId":"5d5a54128ea2287534f949f3"}]} |

        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                      |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"+ USD","searchBy":"fullNameSort"}} |

        Then I should get the response data matches with
            | response                                                     |
            | {"total": 1, "list":[{"userId":"5d5a57b18ea2287534f94a05"}]} |

        # Search name is number
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                  |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"1","searchBy":"fullNameSort"}} |

        Then I should get the response data matches with
            | response                                                     |
            | {"total": 1, "list":[{"userId":"5d3523c5e01cf260ad22cacc"}]} |

        # Search name is special characters
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                     |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"Hội","searchBy":"fullNameSort"}} |

        Then I should get the response data matches with
            | response                                                     |
            | {"total": 1, "list":[{"userId":"5d40153ebd234f2f49ffba00"}]} |

        # Search name is first name
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                             |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"Ride-Sharing","searchBy":"fullNameSort"}} |

        Then I should get the response data matches with
            | response                                                     |
            | {"total": 1, "list":[{"userId":"5d3914266789a11b4c9b5d6b"}]} |

        # Search name is last name
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                             |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"Huynh DN HUE","searchBy":"fullNameSort"}} |

        Then I should get the response data matches with
            | response                                                     |
            | {"total": 1, "list":[{"userId":"5d5a6ab7e66ccc0ab3adece6"}]} |

    Scenario: 02. Operator search driver by phone
        # Search default, sort by registration date
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                        |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"phone"},"sort":{"createdDate":"desc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
            | {"total": 18, "list":[{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d41634c49050a52af4b3e8f"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d3e596046694d6a60b712d2"},{"userId":"5d8c152f9d9d7d4194d8d704"},{"userId":"5d8c15599d9d7d4194d8d706"},{"userId":"5d8c15959d9d7d4194d8d708"}]} |

        # Search phone number is characters
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                          |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"as","searchBy":"phone"},"sort":{"createdDate":"desc"}} |

        Then I should get the response data matches with
            | response                                                                       |
            | {"from":0,"size":20,"total":0,"list":[],"summary":{"total":0,"totalActive":0}} |

        # Search phone number is country code
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                          |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"+1","searchBy":"phone"},"sort":{"createdDate":"desc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
            | {"from":0,"size":20,"total":10,"list":[{"userId":"5d41634c49050a52af4b3e8f"},{"userId":"5d36db57f042ee5f62b35bd3"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d3523c5e01cf260ad22cacc"},{"userId":"5d3e594646694d6a60b712cd"},{"userId":"5d3e596046694d6a60b712d2"},{"userId":"5d3914266789a11b4c9b5d6b"},{"userId":"5d358b00f6c6af6e91a93ae2"},{"userId":"5d8c15599d9d7d4194d8d706"},{"userId":"5d8c152f9d9d7d4194d8d704"}],"summary":{"total":10,"totalActive":4}} |

        # Search phone number is phonenumber
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                                 |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"612123451","searchBy":"phone"},"sort":{"createdDate":"desc"}} |

        Then I should get the response data matches with
            | response                                                                                                            |
            | {"from":0,"size":20,"total":1,"list":[{"userId":"5d5a567b8ea2287534f949fa"}],"summary":{"total":1,"totalActive":1}} |

        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                          |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"51","searchBy":"phone"},"sort":{"createdDate":"desc"}} |

        Then I should get the response data matches with
            | response                                                                                                            |
            | {"from":0,"size":20,"total":1,"list":[{"userId":"5d5a567b8ea2287534f949fa"}],"summary":{"total":1,"totalActive":1}} |

    Scenario: 03. Operator search driver by email
        # Search default, sort by registration date
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                          |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"email"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
            | {"total": 18, "list":[{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d41634c49050a52af4b3e8f"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d3e596046694d6a60b712d2"},{"userId":"5d3e594646694d6a60b712cd"},{"userId":"5d3914266789a11b4c9b5d6b"},{"userId":"5d36db57f042ee5f62b35bd3"},{"userId":"5d358b00f6c6af6e91a93ae2"},{"userId":"5d3523c5e01cf260ad22cacc"}]} |

        # search email is characters
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                           |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"a","searchBy":"email"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                   |
            | {"total": 6, "list":[{"userId":"5d8c15959d9d7d4194d8d708"},{"userId":"5d8c152f9d9d7d4194d8d704"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d358b00f6c6af6e91a93ae2"}]} |

        # search email is format x@
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                            |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"i@","searchBy":"email"}} |

        Then I should get the response data matches with
            | response                                                     |
            | {"total": 1, "list":[{"userId":"5d358b00f6c6af6e91a93ae2"}]} |

        # search email is format @x
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                             |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"@gm","searchBy":"email"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                       |
            | {"total": 4, "list":[{"userId":"5d8c15959d9d7d4194d8d708"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d358b00f6c6af6e91a93ae2"}]} |

    Scenario: 04. Operator search driver by username
        # Search default, sort by registration date
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                             |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"username"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
            | {"total": 18, "list":[{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d41634c49050a52af4b3e8f"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d3e596046694d6a60b712d2"},{"userId":"5d8c152f9d9d7d4194d8d704"},{"userId":"5d8c15599d9d7d4194d8d706"},{"userId":"5d8c15959d9d7d4194d8d708"}]} |

        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                   |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"nghĩa","searchBy":"username"}} |

        Then I should get the response data matches with
            | response                                                                       |
            | {"from":0,"size":20,"total":0,"list":[],"summary":{"total":0,"totalActive":0}} |

        # Search username is characters
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                               |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"info","searchBy":"username"},"sort":{"createdDate":"desc"}} |

        Then I should get the response data matches with
            | response                                                                                           |
            | {"total": 7, "list":[{"userId":"5d8c152f9d9d7d4194d8d704"},{"userId":"5d5a6acfe66ccc0ab3adeceb"}]} |

        # Search username is number
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                              |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"0","searchBy":"username"}} |

        Then I should get the response data matches with
            | response                                                     |
            | {"total": 1, "list":[{"userId":"5d5a54128ea2287534f949f3"}]} |

        # Search username is number and characters
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                               |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"0x","searchBy":"username"}} |

        Then I should get the response data matches with
            | response                                                     |
            | {"total": 1, "list":[{"userId":"5d5a54128ea2287534f949f3"}]} |

    Scenario: 05. Operator search driver by License Plate
        # Search default, sort by registration date
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                            |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"driverInfo.licensePlate"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
            | {"total": 18, "list":[{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d41634c49050a52af4b3e8f"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d3e596046694d6a60b712d2"},{"userId":"5d8c152f9d9d7d4194d8d704"},{"userId":"5d8c15599d9d7d4194d8d706"},{"userId":"5d8c15959d9d7d4194d8d708"}]} |

        # Search license plate is number
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                                            |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"43","searchBy":"driverInfo.licensePlate"},"sort":{"createdDate":"desc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                                                                                                     |
            | {"total": 9, "list":[{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d3e596046694d6a60b712d2"},{"userId":"5d3e594646694d6a60b712cd"},{"userId":"5d3914266789a11b4c9b5d6b"},{"userId":"5d358b00f6c6af6e91a93ae2"},{"userId":"5d3523c5e01cf260ad22cacc"}]} |

        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                                            |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"A1","searchBy":"driverInfo.licensePlate"},"sort":{"createdDate":"desc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                             |
            | {"total": 5, "list":[{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d3914266789a11b4c9b5d6b"},{"userId":"5d358b00f6c6af6e91a93ae2"},{"userId":"5d3523c5e01cf260ad22cacc"}]} |

        # Search license plate is characters
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                                            |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"Ọ","searchBy":"driverInfo.licensePlate"},"sort":{"createdDate":"desc"}} |

        Then I should get the response data matches with
            | response                                                     |
            | {"total": 1, "list":[{"userId":"5d41634c49050a52af4b3e8f"}]} |

        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                                                       |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"43A1 - 555.77","searchBy":"driverInfo.licensePlate"},"sort":{"createdDate":"desc"}} |

        Then I should get the response data matches with
            | response                                                                                           |
            | {"total": 9, "list":[{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d358b00f6c6af6e91a93ae2"}]} |

    Scenario: 06. Operator search driver by company
        # Search default, sort by registration date
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                                                    |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "5d301c6d4de36661193df83a","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"desc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                                                                                                                                            |
            | {"total": 14, "list":[{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d41634c49050a52af4b3e8f"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d3e596046694d6a60b712d2"},{"userId":"5d3e594646694d6a60b712cd"}]} |

    Scenario: 07. Operator search driver by zoneId
        # Search default, sort by registration date
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                                                    |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "5d5a6adee4b02b301b60d701","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"desc"}} |

        Then I should get the response data matches with
            | response                                                                                           |
            | {"total": 2, "list":[{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a6ab7e66ccc0ab3adece6"}]} |
