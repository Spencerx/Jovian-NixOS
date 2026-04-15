{ stdenv, mesa, fetchFromGitHub }:
let
  version = "26.0.0";
  jupiterVersion = "steamos-25.11.10";
in stdenv.mkDerivation {
  pname = "mesa";
  version = "${version}.${jupiterVersion}";

  src = fetchFromGitHub {
    owner = "Jovian-Experiments";
    repo = "mesa";
    rev = jupiterVersion;
    hash = "sha256-oWeaP/tVFaq6jy8AHvM4XdCfJCd32ElsTHiiJIuqs40=";
  };

  inherit (mesa) buildInputs nativeBuildInputs propagatedBuildInputs;

  separateDebugInfo = true;

  mesonAutoFeatures = "auto";

  # See https://github.com/Jovian-Experiments/PKGBUILDs-mirror/blob/jupiter-main/mesa-radv/PKGBUILD
  mesonFlags = [
    "-D android-libbacktrace=disabled"
    "-D b_ndebug=true"
    "-D gallium-mediafoundation=disabled"
    "-D gles1=disabled"
    # "-D intel-rt=enabled"
    "-D libunwind=disabled"
    "-D microsoft-clc=disabled"
    "-D valgrind=enabled"
    "-D video-codecs=all"
    # Jupiter specific options below:
    "-D gallium-drivers="
    "-D gallium-extra-hud=false"
    "-D gallium-rusticl=false"
    "-D html-docs=disabled"
    "-D vulkan-drivers=amd"
    "-D vulkan-layers=anti-lag"
    "-D b_lto=false"
    "-D gallium-va=disabled"
    "-D egl=disabled"
    "-D glx=disabled"
    "-D gbm=disabled"
    "-D gles2=disabled"
    "-D glvnd=disabled"
    "-D llvm=disabled"
    "-D lmsensors=disabled"
    "-D gpuvis=true"
    "-D display-info=disabled"
    "-D amdgpu-virtio=true"
    "-D intel-rt=disabled"
    "-D sysprof=false"
    "-D tools=drm-shim"
    "-D radv-build-id=1b5666bb05a0af64427ab212494159dcffdb62d4"
  ];
}
