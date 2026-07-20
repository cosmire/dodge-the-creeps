// Rewrites the crate + Godot project name to whatever the user chose.
// A plain clone skips this entirely and keeps the default name.
let name = variable::get("project_name");
let crate_name = name.replace("-", "_");

file::rename("rust/Cargo.toml", "rust/Cargo.toml");
for path in ["rust/Cargo.toml", "godot/project.godot", "godot/rust.gdextension"] {
    let text = file::read_to_string(path);
    file::write(path, text
        .replace("dodge-the-creeps", name)
        .replace("dodge_the_creeps", crate_name)
        .replace("Dodge the Creeps", name));
}
