#!/usr/bin/env python3

import argparse
import asyncio
import pyatv
import time

LOOP = asyncio.get_event_loop()

async def connect_and_send_command(loop, address, commands):
    try:
        atvs = await pyatv.scan(loop, hosts=[address])
        atv = await pyatv.connect(atvs[0], loop)
        rc = atv.remote_control
        for command in commands:
            if command == 'sleep':
                time.sleep(1)
            else:
                await getattr(rc, command)()
    finally:
        await atv.close()

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('address', help='device address')
    parser.add_argument('commands', help='comma separated list of comands')
    args = parser.parse_args()
    LOOP.run_until_complete(connect_and_send_command(LOOP, args.address, args.commands.split(',')))