/// setup_enums()

enum DIRECTION {
    north,
    west,
    south,
    east,
    none
}

enum MODES {
    nothing,
    free,
    objectMenu,
    moving,
    attacking,
    defending,
    skills,
    waiting,
    finishing
}


enum sexes {
    none,
    male,
    female
}

enum stats {
    type,
    name,
    hpBase,
    mpBase,
    moveBase,
    initiativeBase,
    fortitudeBase,
    attackBase,
    defenceBase,
    weapon,
    offhand,
    armour,
    length // KEEP AT BOTTOM, USED TO GET THE NUMBER OF STATS
}


enum DEPTH {
    menu,
    fx,
    sky,
    normal,
    ground
}

enum TRIGGER {
    getStats
}

enum VIEWS {
    combat
}


enum AI_TARGET_CHOICES {
    closest,
    lowestHP,
    strongest,
    helpless,
    ranged,
    magical
}


enum AI_OPTIONS {
    Advance,
    Attack,
    Distance,
    MoveTowardsAlly,
    HealSelf,
    HealAlly,
    EndTurn
}

enum TEAMS {
    good,
    evil,
    neutral
}
