#!/usr/bin/env python3

import logging
import pathlib
import subprocess
import sys

try:
    from git.repo import Repo
except ImportError:
    Repo = None

REPO_DIR = pathlib.Path(__file__).parent
SCRIPT_DIR = REPO_DIR / "scripts"
SCRIPTS = {
    SCRIPT_DIR / "unix.sh": "bash",
}

_logger = logging.getLogger(__file__)


def _create_symlink(src: pathlib.Path, dest: pathlib.Path) -> None:
    _logger.debug(f"Linking {src} -> {dest}")

    if dest.is_symlink():
        _logger.info(f"'{dest}' already symlinked")
        if not dest.samefile(src):
            _logger.warning(f"'{dest}' points to '{dest.resolve()}'")
    elif dest.exists():
        _logger.warning(
            f"Symlink destination '{dest}' for source '{src}' already exists. "
            "Skipping.",
        )
    else:
        dest.symlink_to(src.absolute())


def check_version() -> None:
    if not Repo:
        _logger.warning(
            "No VCS information avaliable. GitPython is not installed. "
            "It can be installed by: python3 -m pip install gitpython"
        )
        return

    _logger.info("Checking if this repo is up to date")
    repo = Repo(REPO_DIR)
    if repo.is_dirty():
        _logger.warning("Current repository is dirty")
    # Todo check if behind upstream


def run_scripts() -> None:
    _logger.info("Running scripts")
    for script, interpreter in SCRIPTS.items():
        _logger.info(f"Running {script}")
        subprocess.check_call([interpreter, script])

def install_packages() -> None:
    _logger.info("Installing packages")


def link_config_files() -> None:
    _logger.info("Symlinking config files")
    for dotfile in REPO_DIR.glob("dotfiles/*"):
        _create_symlink(dotfile, pathlib.Path.home() / dotfile.name)


def validate_setup() -> None:
    _logger.info("Validating setup")


def main() -> int:
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s %(name)s: [%(levelname)s] %(message)s",
        datefmt="%Y-%m-%d %T",
    )

    check_version()
    run_scripts()
    install_packages()
    link_config_files()

    _logger.info("Setup complete")

    validate_setup()
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except Exception as ex:
        _logger.critical(f"Uncaught exception: {ex}")
        _logger.debug("Stack trace:", exc_info=True)

    sys.exit(-1)
