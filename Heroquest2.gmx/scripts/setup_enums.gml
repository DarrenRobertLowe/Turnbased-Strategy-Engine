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


enum SEXES {
    none,
    male,
    female
}


enum HEROSTATS { // see add_new_hero()
    type,
    sex,
    name,
    hp,
    mp,
    move,
    attack,
    defence,
    weapon,
    offhand,
    armour,
    amulet,
    ring1,
    ring2,
    hair,
    face,
    skin,
    length  // KEEP AT BOTTOM! used to count the number of possible stats
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
