variable "ALPINE_VERSION" {
    default = "edge"
}
variable "S6_VERSION" {
    default = "v3.2.1.0"
}
variable "UNOSERVER_REST_API_VERSION" {
    default = "v0.8.0"
}

target "docker-metadata-action" {}

target "default" {
    inherits = ["docker-metadata-action"]
    dockerfile = "Dockerfile"
    context = "."
    args = {
        ALPINE_VERSION = "${ALPINE_VERSION}"
        S6_VERSION = "${S6_VERSION}"
        UNOSERVER_REST_API_VERSION = "${UNOSERVER_REST_API_VERSION}"
    }
    platforms = [
        "linux/amd64",
        "linux/arm64",
    ]
}
