Feature: Search name customer
    As an operator,
    I want to search name customer.

    Background:

    Scenario: 01. Operator search customer by name
        # Search default, sort by registration date
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                          |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":"fullNameSort"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
            | {"total": 54, "list":[{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d5bb58726b2fa660a29aab2"},{"userId":"5d556d8daf516c610be496b5"},{"userId":"5d522f6e2af5be0a85d06a60"},{"userId":"5d43b7e418697045a1ef566e"},{"userId":"5d43b6eb18697045a1ef565d"},{"userId":"5d43ac752c8e783d1fde10f0"},{"userId":"5d428c0f10148923f8e4ee3e"},{"userId":"5d42702a438d95154489ad89"},{"userId":"5d416806ed42d70b843e6fc4"},{"userId":"5d4167b4ed42d70b843e6fbd"},{"userId":"5d416778ed42d70b843e6fb6"}]} |

        # search not input data
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                        |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":"fullNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response      |
            | {"total": 54} |

        # search full name is characters
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                   |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"Nghia HUynh","searchBy":"fullNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                                                           |
            | {"list":[{"userId": "5d5f523a25eff4133af01b65"},{"userId": "5d43ac752c8e783d1fde10f0"},{"userId": "5d397dc8d6977739e1635300"},{"userId": "5d36f443566dac747b6ea26e"},{"userId": "5d36f306566dac747b6ea25e"},{"userId": "5d36c93b2a2d515242d2d747"},{"userId": "5d356f756396d371fde9d7fa"},{"userId": "5d301c4827b0686ff2eb1c9f"}]} |

        # search full name is number
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                           |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"235","searchBy":"fullNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                          |
            | {"list":[{"userId": "5d6e3b09cd1378324f4a2991"}]} |

        # search full name is special characters
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                              |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"Nghĩa","searchBy":"fullNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                          |
            | {"list":[{"userId": "5d43b6eb18697045a1ef565d"}]} |

        # search first name
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                  |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"nghia huyy","searchBy":"fullNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                                                                                        |
            | {"list":[{"userId": "5d522f6e2af5be0a85d06a60"},{"userId": "5d3836e16789a11b4c9b5d4c"},{"userId": "5d36b12aafe4e4339da41350"}]} |

        # search last name
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                 |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"jkj ljklj","searchBy":"fullNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                                                 |
            | {"list":[{"userId": "5d36b12aafe4e4339da41350"},{"userId": "5d3836e16789a11b4c9b5d4c"}]} |

    Scenario: 02. Operator search customer by phone number
        # search not input data
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                 |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":"phone"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response      |
            | {"total": 54} |

        # search phone number is characters
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                  |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"a","searchBy":"phone"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                 |
            | {"from":0,"size":20,"total":0,"list":[]} |

        # search phone number is country code
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                    |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"+84","searchBy":"phone"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
            | {"total": 11, "list":[{"userId":"5d5bb58726b2fa660a29aab2"},{"userId":"5d380a3f0a230b06c216cc30"},{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d381662cab1ef0f985e5898"},{"userId":"5d36ece58934dc6fac3041ae"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"}]} |

        # search phone number is country code and phone number
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                     |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"+843","searchBy":"phone"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                 |
            | {"total": 3, "list":[{"userId":"5d5bb58726b2fa660a29aab2"},{"userId":"5d380a3f0a230b06c216cc30"},{"userId":"5d381662cab1ef0f985e5898"}]} |

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                             |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"+84348811525","searchBy":"phone"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                     |
            | {"total": 1, "list":[{"userId":"5d5bb58726b2fa660a29aab2"}]} |

        # search phone number is phone number
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                           |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"2055550027","searchBy":"phone"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                     |
            | {"total": 1, "list":[{"userId":"5d43b7e418697045a1ef566e"}]} |

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                    |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"897","searchBy":"phone"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                 |
            | {"from":0,"size":20,"total":0,"list":[]} |

    Scenario: 03. Operator search customer by email
        # search not input data
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                 |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":"email"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response      |
            | {"total": 54} |

        # search email is characters
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                  |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"z","searchBy":"email"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                                                                                                                                            |
            | {"total": 10, "list":[{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d556d8daf516c610be496b5"},{"userId":"5d397dc8d6977739e1635300"},{"userId":"5d3917a8ad35372093bf920f"},{"userId":"5d36f443566dac747b6ea26e"},{"userId":"5d36f306566dac747b6ea25e"},{"userId":"5d36c93b2a2d515242d2d747"},{"userId":"5d367f53957d9b1d36c7f327"},{"userId":"5d356f756396d371fde9d7fa"},{"userId":"5d3187cd5f1f940d575a7849"}]} |

        # search email with format @xx
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                    |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"@ab","searchBy":"email"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                                                           |
            | {"total": 2, "list":[{"userId":"5d36b951591f65453b3c16fe"},{"userId":"5d36b4693b098d431d8936dc"}]} |

        # search email with format x@xx
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                     |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"e@ab","searchBy":"email"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                     |
            | {"total": 1, "list":[{"userId":"5d36b951591f65453b3c16fe"}]} |

        # search email is correct email
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                           |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"abb@cc.com","searchBy":"email"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                     |
            | {"total": 1, "list":[{"userId":"5d43ac752c8e783d1fde10f0"}]} |

    Scenario: 04. Operator search customer by corporation
        # search not input data
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                           |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":"passengerInfo.corporateNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response      |
            | {"total": 54} |

        # search corporate is characters
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                             |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"yu","searchBy":"passengerInfo.corporateNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                         |
            | {"total": 7, "list":[{"userId":"5d3e9b288bfb355abe681adf"},{"userId":"5d3e74b38bfb355abe6818ef"},{"userId":"5d3a76a4a582734d619ce25f"},{"userId":"5d3a6ef2a582734d619ce1a8"},{"userId":"5d3917a8ad35372093bf920f"},{"userId":"5d3836e16789a11b4c9b5d4c"},{"userId":"5d36f306566dac747b6ea25e"}]} |

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                             |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"mi","searchBy":"passengerInfo.corporateNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                         |
            | {"total": 7, "list":[{"userId":"5d3e9b288bfb355abe681adf"},{"userId":"5d3e74b38bfb355abe6818ef"},{"userId":"5d3a76a4a582734d619ce25f"},{"userId":"5d3a6ef2a582734d619ce1a8"},{"userId":"5d3917a8ad35372093bf920f"},{"userId":"5d3836e16789a11b4c9b5d4c"},{"userId":"5d36f306566dac747b6ea25e"}]} |

        # search corporate is characters
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                             |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"ho","searchBy":"passengerInfo.corporateNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                 |
            | {"from":0,"size":20,"total":0,"list":[]} |


    Scenario: 04. Operator search customer by date registration
        # search not input data
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                            |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"2019-08-31T17:00:00.000Z","endDate":"2019-09-24T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                     |
            | {"total": 1,"list":[{"userId": "5d6e3b09cd1378324f4a2991"}]} |

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                            |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"2019-08-31T17:00:00.000Z","endDate":"2019-09-02T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                 |
            | {"from":0,"size":20,"total":0,"list":[]} |

        # search by date registration and name
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                                             |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"2019-06-30T17:00:00.000Z","endDate":"2019-07-18T17:00:00.000Z","txtSearch":"nghia","searchBy":"fullNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                                       |
            | {"from":0,"size":20,"total":1,"list":[{"userId": "5d301c4827b0686ff2eb1c9f"}]} |

        # search by date registration and phone
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                                   |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-24T17:00:00.000Z","endDate":"2019-07-26T17:00:00.000Z","txtSearch":"55","searchBy":"phone"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                          |
            | {"from":0,"size":20,"total":6,"list":[{"userId": "5d3a76a4a582734d619ce25f"},{"userId": "5d3a6ef2a582734d619ce1a8"},{"userId": "5d397e7ed6977739e1635311"},{"userId": "5d397dc8d6977739e1635300"},{"userId": "5d392995a555a01faf354d5e"},{"userId": "5d3917a8ad35372093bf920f"}]} |

        # search by date registration and email
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                                    |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-24T17:00:00.000Z","endDate":"2019-07-26T17:00:00.000Z","txtSearch":"@bb","searchBy":"email"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                                       |
            | {"from":0,"size":20,"total":1,"list":[{"userId": "5d3a76a4a582734d619ce25f"}]} |

        # search by date registration and email
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                                                             |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-24T17:00:00.000Z","endDate":"2019-07-26T17:00:00.000Z","txtSearch":"yu","searchBy":"passengerInfo.corporateNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                     |
            | {"from":0,"size":20,"total":3,"list":[{"userId": "5d3a76a4a582734d619ce25f"},{"userId": "5d3a6ef2a582734d619ce1a8"},{"userId": "5d3917a8ad35372093bf920f"}]} |
