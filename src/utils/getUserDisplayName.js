export default function getUserDisplayName(user) {
    const metadata = user?.user_metadata || {}
    const username = typeof metadata.username === "string"
        ? metadata.username.replace(/^@/, "")
        : ""
    const name = [
        metadata.name,
        metadata.full_name,
        metadata.display_name,
        user?.name,
        username
    ].find((value) => typeof value === "string" && value.trim())

    return name?.trim() || user?.email?.split("@")[0] || "Usuário"
}
