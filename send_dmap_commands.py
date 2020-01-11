#!/usr/bin/env python3

import argparse
import asyncio
import pyatv

IGNORED_ID = 'some_id'

LOOP = asyncio.get_event_loop()

async def connect_and_send_command(loop, name, address, credentials, commands):
    try:
        config = pyatv.conf.AppleTV(address, name)
        config.add_service(pyatv.conf.DmapService(IGNORED_ID, credentials))
        atv = await pyatv.connect(config, loop)
        rc = atv.remote_control
        for command in commands:
            await getattr(rc, command)()
    finally:
        await atv.close()

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('name', help='device name')
    parser.add_argument('address', help='device address')
    parser.add_argument('credentials', help='device credentials')
    parser.add_argument('commands', help='comma separated list of comands')
    args = parser.parse_args()
    LOOP.run_until_complete(connect_and_send_command(LOOP, args.name, args.address, args.credentials, args.commands.split(',')))