local emojis = {
    { value = "🎨", text = ":art:", description = "Improve structure / format of the code." },
    { value = "⚡️", text = ":zap:", description = "Improve performance." },
    { value = "🔥", text = ":fire:", description = "Remove code or files." },
    { value = "🐛", text = ":bug:", description = "Fix a bug." },
    { value = "🚑️", text = ":ambulance:", description = "Critical hotfix." },
    { value = "✨", text = ":sparkles:", description = "Introduce new features." },
    { value = "📝", text = ":memo:", description = "Add or update documentation." },
    { value = "🚀", text = ":rocket:", description = "Deploy stuff." },
    { value = "💄", text = ":lipstick:", description = "Add or update the UI and style files." },
    { value = "🎉", text = ":tada:", description = "Begin a project." },
    { value = "✅", text = ":white_check_mark:", description = "Add, update, or pass tests." },
    { value = "🔒️", text = ":lock:", description = "Fix security or privacy issues." },
    { value = "🔐", text = ":closed_lock_with_key:", description = "Add or update secrets." },
    { value = "🔖", text = ":bookmark:", description = "Release / Version tags." },
    { value = "🚨", text = ":rotating_light:", description = "Fix compiler / linter warnings." },
    { value = "🚧", text = ":construction:", description = "Work in progress." },
    { value = "💚", text = ":green_heart:", description = "Fix CI Build." },
    { value = "⬇️", text = ":arrow_down:", description = "Downgrade dependencies." },
    { value = "⬆️", text = ":arrow_up:", description = "Upgrade dependencies." },
    { value = "📌", text = ":pushpin:", description = "Pin dependencies to specific versions." },
    { value = "👷", text = ":construction_worker:", description = "Add or update CI build system." },
    { value = "📈", text = ":chart_with_upwards_trend:", description = "Add or update analytics or track code." },
    { value = "♻️", text = ":recycle:", description = "Refactor code." },
    { value = "➕", text = ":heavy_plus_sign:", description = "Add a dependency." },
    { value = "➖", text = ":heavy_minus_sign:", description = "Remove a dependency." },
    { value = "🔧", text = ":wrench:", description = "Add or update configuration files." },
    { value = "🔨", text = ":hammer:", description = "Add or update development scripts." },
    { value = "🌐", text = ":globe_with_meridians:", description = "Internationalization and localization." },
    { value = "✏️", text = ":pencil2:", description = "Fix typos." },
    { value = "💩", text = ":poop:", description = "Write bad code that needs to be improved." },
    { value = "⏪️", text = ":rewind:", description = "Revert changes." },
    { value = "🔀", text = ":twisted_rightwards_arrows:", description = "Merge branches." },
    { value = "📦️", text = ":package:", description = "Add or update compiled files or packages." },
    { value = "👽️", text = ":alien:", description = "Update code due to external API changes." },
    { value = "🚚", text = ":truck:", description = "Move or rename resources (e.g.: files, paths, routes)." },
    { value = "📄", text = ":page_facing_up:", description = "Add or update license." },
    { value = "💥", text = ":boom:", description = "Introduce breaking changes." },
    { value = "🍱", text = ":bento:", description = "Add or update assets." },
    { value = "♿️", text = ":wheelchair:", description = "Improve accessibility." },
    { value = "💡", text = ":bulb:", description = "Add or update comments in source code." },
    { value = "🍻", text = ":beers:", description = "Write code drunkenly." },
    { value = "💬", text = ":speech_balloon:", description = "Add or update text and literals." },
    { value = "🗃️", text = ":card_file_box:", description = "Perform database related changes." },
    { value = "🔊", text = ":loud_sound:", description = "Add or update logs." },
    { value = "🔇", text = ":mute:", description = "Remove logs." },
    { value = "👥", text = ":busts_in_silhouette:", description = "Add or update contributor(s)." },
    { value = "🚸", text = ":children_crossing:", description = "Improve user experience / usability." },
    { value = "🏗️", text = ":building_construction:", description = "Make architectural changes." },
    { value = "📱", text = ":iphone:", description = "Work on responsive design." },
    { value = "🤡", text = ":clown_face:", description = "Mock things." },
    { value = "🥚", text = ":egg:", description = "Add or update an easter egg." },
    { value = "🙈", text = ":see_no_evil:", description = "Add or update a .gitignore file." },
    { value = "📸", text = ":camera_flash:", description = "Add or update snapshots." },
    { value = "⚗️", text = ":alembic:", description = "Perform experiments." },
    { value = "🔍️", text = ":mag:", description = "Improve SEO." },
    { value = "🏷️", text = ":label:", description = "Add or update types." },
    { value = "🌱", text = ":seedling:", description = "Add or update seed files." },
    { value = "🚩", text = ":triangular_flag_on_post:", description = "Add, update, or remove feature flags." },
    { value = "🥅", text = ":goal_net:", description = "Catch errors." },
    { value = "💫", text = ":dizzy:", description = "Add or update animations and transitions." },
    { value = "🗑️", text = ":wastebasket:", description = "Deprecate code that needs to be cleaned up." },
    {
        value = "🛂",
        text = ":passport_control:",
        description = "Work on code related to authorization, roles and permissions.",
    },
    { value = "🩹", text = ":adhesive_bandage:", description = "Simple fix for a non-critical issue." },
    { value = "🧐", text = ":monocle_face:", description = "Data exploration/inspection." },
    { value = "⚰️", text = ":coffin:", description = "Remove dead code." },
    { value = "🧪", text = ":test_tube:", description = "Add a failing test." },
    { value = "👔", text = ":necktie:", description = "Add or update business logic." },
    { value = "🩺", text = ":stethoscope:", description = "Add or update healthcheck." },
    { value = "🧱", text = ":bricks:", description = "Infrastructure related changes." },
    { value = "🧑‍💻", text = ":technologist:", description = "Improve developer experience." },
    { value = "💸", text = ":money_with_wings:", description = "Add sponsorships or money related infrastructure." },
    { value = "🧵", text = ":thread:", description = "Add or update code related to multithreading or concurrency." },
    { value = "🦺", text = ":safety_vest:", description = "Add or update code related to validation." },
}

return emojis
