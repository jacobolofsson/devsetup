#!/usr/bin/env python3

import logging
import pathlib
import sys

from git.repo import Repo

_logger = logging.getLogger(__file__)


def _create_symlink(src: pathlib.Path, dest: pathlib.Path) -> None:
    _logger.debug(f"Linking {src} -> {dest}")
    if dest.exists():
        _logger.warning(
            f"Symlink destination '{dest}' for source '{src}' already exists. "
            "Skipping.",
        )
    else:
        dest.symlink_to(src)


def check_version() -> None:
    _logger.info("Checking if this repo is up to date")


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
