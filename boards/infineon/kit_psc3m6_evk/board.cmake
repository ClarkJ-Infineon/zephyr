# SPDX-FileCopyrightText: Copyright (c) 2026 Infineon Technologies AG,
# SPDX-FileCopyrightText: or an affiliate of Infineon Technologies AG. All rights reserved.
#
# SPDX-License-Identifier: Apache-2.0

# KIT_PSC3M6_EVK carries an on-board SEGGER J-Link debug probe, which the
# board documentation already requires to be v9.68 or later. Wiring the
# J-Link runner lets `west flash` and `west debug` work with a stock Zephyr
# toolchain, with no separate Infineon OpenOCD installation.
#
# PSC3M6GES3AH is the J-Link device entry matching this board's SoC,
# psc3m6ges3ahq1. The entry is present from J-Link v9.78.
board_runner_args(jlink "--device=PSC3M6GES3AH" "--speed=4000")
include(${ZEPHYR_BASE}/boards/common/jlink.board.cmake)

# Infineon OpenOCD remains supported as an alternate runner; select it with
# `west flash --runner openocd`. It requires the ModusToolbox™ Programming
# Tools package or a standalone Infineon OpenOCD release.
board_runner_args(openocd "--target-handle=TARGET.cm33")
include(${ZEPHYR_BASE}/boards/common/openocd.board.cmake)
