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
    reloading,
    skills,
    waiting,
    finishing
}


// update setup_classnames() if editing
enum classes {
    None,
    Pirate,
    Swabber,
    Cavalier,
    Pistoleer,
    Musketeer,
}

enum avatar_index {
    none,
    female,
    male,
    pirate
}

enum sexes {
    none,
    male,
    female
}

enum unitStats {
    type,
    name,
    level,
    hpBase,
    mpBase,
    moveBase,
    initiativeBase,
    fortitudeBase,
    attackBase,
    defenceBase,
    weaponId,
    offhand,
    armour,
    avatar,
    length      // KEEP AT BOTTOM, USED TO GET THE NUMBER OF STATS
}

enum weapons {
    unarmed,
    cutlass,
    woodenmop,
    bow
}


// update load_weapon() if editing
enum weaponStats {
    type,       // this is the weapon object, e.g. Cutlass, Mop
    name,       
    pwr,
    dice,
    range,
    diagonal,   // can attack diagonally?
    modifiers,  // this points to an entry in an persistent_modifiers map
    animation,
    length      // KEEP AT BOTTOM, USED TO GET THE NUMBER OF STATS
}

enum attackAnimations {
    punch,
    slash,
    bash,
    bow,
    pistol,
    rifle,
    throw,
    reloading,
    cast
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
    EscapeFire,
    Advance,
    Attack,
    Distance,
    Retreat,    // probably moves towards the nearest ally
    HealSelf,
    HealAlly,
    EndTurn
}

enum TEAMS {
    fire,
    ally,
    enemy,
    neutral
}
