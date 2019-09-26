Feature: Sort name partner
    As an operator,
    I want to search name customer.

    Background:
    # 1: asc tang > giam ; -1: desc giam > tang
    Scenario: 01. Operator sort partner by name
        # Search default, sort by registration date
        When I want to request api ELKSearch partner with data
            | requestData                                                                                                                 |
            | {"size":20,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"","searchBy":"fullNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                         |
            | {"total": 7, "list":[{"userId":"56e683030cf257b1733c9c27"},{"userId":"5670efea0cf2eb9c770e230d"},{"userId":"5c654c651a9f081dc1f259c0"},{"userId":"5667f0040cf2eb9c770e11b2"},{"userId":"56e6837c0cf257b1733c9c2b"},{"userId":"565d1af20cf2cc62579cf5bc"},{"userId":"569da1550cf2ab2ab653c8d2"}]} |

        When I want to request api ELKSearch partner with data
            | requestData                                                                                                                  |
            | {"size":20,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"","searchBy":"fullNameSort"},"sort":{"fullNameSort":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                         |
            | {"total": 7, "list":[{"userId":"569da1550cf2ab2ab653c8d2"},{"userId":"565d1af20cf2cc62579cf5bc"},{"userId":"56e6837c0cf257b1733c9c2b"},{"userId":"5667f0040cf2eb9c770e11b2"},{"userId":"5c654c651a9f081dc1f259c0"},{"userId":"5670efea0cf2eb9c770e230d"},{"userId":"56e683030cf257b1733c9c27"}]} |

    Scenario: 02. Operator sort partner by phone
        # Search default, sort by registration date
        When I want to request api ELKSearch partner with data
            | requestData                                                                                                          |
            | {"size":20,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"","searchBy":"fullNameSort"},"sort":{"phone":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                         |
            | {"total": 7, "list":[{"userId":"569da1550cf2ab2ab653c8d2"},{"userId":"5c654c651a9f081dc1f259c0"},{"userId":"565d1af20cf2cc62579cf5bc"},{"userId":"5670efea0cf2eb9c770e230d"},{"userId":"56e683030cf257b1733c9c27"},{"userId":"5667f0040cf2eb9c770e11b2"},{"userId":"56e6837c0cf257b1733c9c2b"}]} |

        When I want to request api ELKSearch partner with data
            | requestData                                                                                                           |
            | {"size":20,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"","searchBy":"fullNameSort"},"sort":{"phone":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                         |
            | {"total": 7, "list":[{"userId":"56e6837c0cf257b1733c9c2b"},{"userId":"5667f0040cf2eb9c770e11b2"},{"userId":"56e683030cf257b1733c9c27"},{"userId":"5670efea0cf2eb9c770e230d"},{"userId":"565d1af20cf2cc62579cf5bc"},{"userId":"5c654c651a9f081dc1f259c0"},{"userId":"569da1550cf2ab2ab653c8d2"}]} |

    Scenario: 03. Operator sort partner by queuing area
        # Search default, sort by registration date
        When I want to request api ELKSearch partner with data
            | requestData                                                                                                                                     |
            | {"size":20,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"","searchBy":"fullNameSort"},"sort":{"mDispatcherInfo.queuingArea.name":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                         |
            | {"total": 7, "list":[{"userId":"5c654c651a9f081dc1f259c0"},{"userId":"56e683030cf257b1733c9c27"},{"userId":"56e6837c0cf257b1733c9c2b"},{"userId":"569da1550cf2ab2ab653c8d2"},{"userId":"5670efea0cf2eb9c770e230d"},{"userId":"565d1af20cf2cc62579cf5bc"},{"userId":"5667f0040cf2eb9c770e11b2"}]} |

        When I want to request api ELKSearch partner with data
            | requestData                                                                                                                                      |
            | {"size":20,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"","searchBy":"fullNameSort"},"sort":{"mDispatcherInfo.queuingArea.name":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                         |
            | {"total": 7, "list":[{"userId":"5667f0040cf2eb9c770e11b2"},{"userId":"5670efea0cf2eb9c770e230d"},{"userId":"565d1af20cf2cc62579cf5bc"},{"userId":"56e6837c0cf257b1733c9c2b"},{"userId":"569da1550cf2ab2ab653c8d2"},{"userId":"5c654c651a9f081dc1f259c0"},{"userId":"56e683030cf257b1733c9c27"}]} |

    Scenario: 04. Operator sort partner by partner type
        # Search default, sort by registration date
        When I want to request api ELKSearch partner with data
            | requestData                                                                                                                                     |
            | {"size":20,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"","searchBy":"fullNameSort"},"sort":{"mDispatcherInfo.partnerType.name":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                         |
            | {"total": 7, "list":[{"userId":"569da1550cf2ab2ab653c8d2"},{"userId":"56e6837c0cf257b1733c9c2b"},{"userId":"56e683030cf257b1733c9c27"},{"userId":"5670efea0cf2eb9c770e230d"},{"userId":"5667f0040cf2eb9c770e11b2"},{"userId":"565d1af20cf2cc62579cf5bc"},{"userId":"5c654c651a9f081dc1f259c0"}]} |

        When I want to request api ELKSearch partner with data
            | requestData                                                                                                                                      |
            | {"size":20,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"","searchBy":"fullNameSort"},"sort":{"mDispatcherInfo.partnerType.name":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                         |
            | {"total": 7, "list":[{"userId":"5c654c651a9f081dc1f259c0"},{"userId":"56e6837c0cf257b1733c9c2b"},{"userId":"56e683030cf257b1733c9c27"},{"userId":"5670efea0cf2eb9c770e230d"},{"userId":"5667f0040cf2eb9c770e11b2"},{"userId":"565d1af20cf2cc62579cf5bc"},{"userId":"569da1550cf2ab2ab653c8d2"}]} |

    Scenario: 05. Operator sort partner by registration date
        # Search default, sort by registration date
        When I want to request api ELKSearch partner with data
            | requestData                                                                                                                |
            | {"size":20,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                         |
            | {"total": 7, "list":[{"userId":"565d1af20cf2cc62579cf5bc"},{"userId":"5667f0040cf2eb9c770e11b2"},{"userId":"5670efea0cf2eb9c770e230d"},{"userId":"569da1550cf2ab2ab653c8d2"},{"userId":"56e683030cf257b1733c9c27"},{"userId":"56e6837c0cf257b1733c9c2b"},{"userId":"5c654c651a9f081dc1f259c0"}]} |

        When I want to request api ELKSearch partner with data
            | requestData                                                                                                                 |
            | {"size":20,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                         |
            | {"total": 7, "list":[{"userId":"5c654c651a9f081dc1f259c0"},{"userId":"56e6837c0cf257b1733c9c2b"},{"userId":"56e683030cf257b1733c9c27"},{"userId":"569da1550cf2ab2ab653c8d2"},{"userId":"5670efea0cf2eb9c770e230d"},{"userId":"5667f0040cf2eb9c770e11b2"},{"userId":"565d1af20cf2cc62579cf5bc"}]} |

    Scenario: 06. Operator sort partner by status
        # Search default, sort by registration date
        When I want to request api ELKSearch partner with data
            | requestData                                                                                                            |
            | {"size":5,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"","searchBy":"fullNameSort"},"sort":{"isActive":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                             |
            | {"total": 7, "list":[{"userId":"5c654c651a9f081dc1f259c0"},{"userId":"56e6837c0cf257b1733c9c2b"},{"userId":"56e683030cf257b1733c9c27"},{"userId":"569da1550cf2ab2ab653c8d2"},{"userId":"5670efea0cf2eb9c770e230d"}]} |

        When I want to request api ELKSearch partner with data
            | requestData                                                                                                             |
            | {"size":5,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"","searchBy":"fullNameSort"},"sort":{"isActive":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                             |
            | {"total": 7, "list":[{"userId":"5c654c651a9f081dc1f259c0"},{"userId":"56e6837c0cf257b1733c9c2b"},{"userId":"56e683030cf257b1733c9c27"},{"userId":"569da1550cf2ab2ab653c8d2"},{"userId":"5670efea0cf2eb9c770e230d"}]} |
