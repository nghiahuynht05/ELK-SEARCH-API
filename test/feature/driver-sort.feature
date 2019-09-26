Feature: Sort name driver
    As an operator,
    I want to search name customer.

    Background:
    # 1: asc tang > giam ; -1: desc giam > tang
    Scenario: 01. Operator sort by name
        # Sort default, sort by registration date
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                               |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
            | {"total": 18, "list":[{"userId":"5d8c15959d9d7d4194d8d708"},{"userId":"5d8c15599d9d7d4194d8d706"},{"userId":"5d8c152f9d9d7d4194d8d704"},{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d41634c49050a52af4b3e8f"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d3e596046694d6a60b712d2"},{"userId":"5d3e594646694d6a60b712cd"},{"userId":"5d3914266789a11b4c9b5d6b"},{"userId":"5d36db57f042ee5f62b35bd3"},{"userId":"5d358b00f6c6af6e91a93ae2"},{"userId":"5d3523c5e01cf260ad22cacc"}],"summary":{"total":18,"totalActive":8}} |

        # Sort driver by name
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                               |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                               |
            | {"from":0,"size":10,"total": 18, "list":[{"userId":"5d41634c49050a52af4b3e8f"},{"userId":"5d36db57f042ee5f62b35bd3"},{"userId":"5d8c15599d9d7d4194d8d706"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d8c152f9d9d7d4194d8d704"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a57b18ea2287534f94a05"}]} |

        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                                |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"fullNameSort":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                               |
            | {"from":0,"size":10,"total": 18, "list":[{"userId":"5d358b00f6c6af6e91a93ae2"},{"userId":"5d3914266789a11b4c9b5d6b"},{"userId":"5d3e596046694d6a60b712d2"},{"userId":"5d3e594646694d6a60b712cd"},{"userId":"5d3523c5e01cf260ad22cacc"},{"userId":"5d8c15959d9d7d4194d8d708"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a578c8ea2287534f94a00"}]} |

        # Sort driver by name and search name
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                                 |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"uy","searchBy":"fullNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                      |
            | {"from":0,"size":10,"total": 6, "list":[{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a567b8ea2287534f949fa"}]} |

        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                                  |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"uy","searchBy":"fullNameSort"},"sort":{"fullNameSort":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                      |
            | {"from":0,"size":10,"total": 6, "list":[{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a54128ea2287534f949f3"}]} |

    Scenario: 02. Operator sort by phone number
        # Sort driver by phone
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                        |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"phone":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                               |
            | {"from":0,"size":10,"total": 18, "list":[{"userId":"5d36db57f042ee5f62b35bd3"},{"userId":"5d8c15599d9d7d4194d8d706"},{"userId":"5d3523c5e01cf260ad22cacc"},{"userId":"5d3e594646694d6a60b712cd"},{"userId":"5d3e596046694d6a60b712d2"},{"userId":"5d3914266789a11b4c9b5d6b"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d358b00f6c6af6e91a93ae2"},{"userId":"5d41634c49050a52af4b3e8f"},{"userId":"5d8c152f9d9d7d4194d8d704"}]} |

        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                         |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"phone":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                               |
            | {"from":0,"size":10,"total": 18, "list":[{"userId":"5d8c15959d9d7d4194d8d708"},{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d8c152f9d9d7d4194d8d704"},{"userId":"5d41634c49050a52af4b3e8f"}]} |

    Scenario: 03. Operator sort by username
        # Sort driver by username
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                           |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"username":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                               |
            | {"from":0,"size":10,"total": 18, "list":[{"userId":"5d8c15959d9d7d4194d8d708"},{"userId":"5d8c15599d9d7d4194d8d706"},{"userId":"5d8c152f9d9d7d4194d8d704"},{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a54128ea2287534f949f3"}]} |

        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                            |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"username":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                               |
            | {"from":0,"size":10,"total": 18, "list":[{"userId":"5d8c15599d9d7d4194d8d706"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d8c15959d9d7d4194d8d708"},{"userId":"5d8c152f9d9d7d4194d8d704"},{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a578c8ea2287534f94a00"}]} |

        # Sort driver by user and search name
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                             |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"uy","searchBy":"fullNameSort"},"sort":{"username":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                      |
            | {"from":0,"size":10,"total": 6, "list":[{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d5a57b18ea2287534f94a05"}]} |

        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                              |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"uy","searchBy":"fullNameSort"},"sort":{"username":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                      |
            | {"from":0,"size":10,"total": 6, "list":[{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a567b8ea2287534f949fa"}]} |

    Scenario: 04. Operator sort by last active date
        # Sort driver by last active date
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                             |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"lastActive":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                               |
            | {"from":0,"size":10,"total": 18, "list":[{"userId":"5d41634c49050a52af4b3e8f"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d36db57f042ee5f62b35bd3"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d3914266789a11b4c9b5d6b"},{"userId":"5d3e596046694d6a60b712d2"},{"userId":"5d3e594646694d6a60b712cd"},{"userId":"5d358b00f6c6af6e91a93ae2"},{"userId":"5d3523c5e01cf260ad22cacc"}]} |

        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                              |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"lastActive":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                               |
            | {"from":0,"size":10,"total": 18, "list":[{"userId":"5d3523c5e01cf260ad22cacc"},{"userId":"5d358b00f6c6af6e91a93ae2"},{"userId":"5d3e594646694d6a60b712cd"},{"userId":"5d3e596046694d6a60b712d2"},{"userId":"5d3914266789a11b4c9b5d6b"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d36db57f042ee5f62b35bd3"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d41634c49050a52af4b3e8f"}]} |

    Scenario: 05. Operator sort by last Registration Date
        # Sort driver by last active date
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                              |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                               |
            | {"from":0,"size":10,"total": 18, "list":[{"userId":"5d3523c5e01cf260ad22cacc"},{"userId":"5d358b00f6c6af6e91a93ae2"},{"userId":"5d36db57f042ee5f62b35bd3"},{"userId":"5d3914266789a11b4c9b5d6b"},{"userId":"5d3e594646694d6a60b712cd"},{"userId":"5d3e596046694d6a60b712d2"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d41634c49050a52af4b3e8f"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d5a567b8ea2287534f949fa"}]} |

        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                               |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                               |
            | {"from":0,"size":10,"total": 18, "list":[{"userId":"5d8c15959d9d7d4194d8d708"},{"userId":"5d8c15599d9d7d4194d8d706"},{"userId":"5d8c152f9d9d7d4194d8d704"},{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a54128ea2287534f949f3"}]} |

        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                               |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"z","searchBy":"fullNameSort"},"sort":{"createdDate":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                              |
            | {"from":0,"size":10,"total": 2, "list":[{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d8c15959d9d7d4194d8d708"}]} |
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                                |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"z","searchBy":"fullNameSort"},"sort":{"createdDate":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                              |
            | {"from":0,"size":10,"total": 2, "list":[{"userId":"5d8c15959d9d7d4194d8d708"},{"userId":"5d40153ebd234f2f49ffba00"}]} |
