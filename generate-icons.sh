#!/bin/bash
# Generate simple PNG icons using Python with built-in modules

python3 << 'PYTHON'
import struct
import zlib

def create_png(width, height, color_bg=(99, 102, 241), color_moon=(255, 255, 255)):
    """Create a simple PNG with a moon icon"""
    
    def to_bytes(value, length):
        return value.to_bytes(length, 'big')
    
    # Create image data (RGBA)
    pixels = []
    cx, cy = width // 2, height // 2
    r = min(width, height) // 3
    
    for y in range(height):
        row = [0]  # Filter byte
        for x in range(width):
            # Background gradient
            t = (x + y) / (width + height)
            bg_r = int(99 + (139 - 99) * t)
            bg_g = int(102 + (92 - 102) * t)
            bg_b = int(241 + (246 - 241) * t)
            
            # Distance from center
            dx = x - cx
            dy = y - cy
            dist = (dx*dx + dy*dy) ** 0.5
            
            # Moon (crescent shape)
            moon_offset = r * 0.4
            dist_offset = ((dx - moon_offset)**2 + dy**2) ** 0.5
            
            if dist < r and dist_offset > r * 0.85:
                # Moon pixel
                row.extend([255, 255, 255, 240])
            else:
                # Background
                row.extend([bg_r, bg_g, bg_b, 255])
        pixels.append(bytes(row))
    
    # Compress image data
    raw_data = b''.join(pixels)
    compressed = zlib.compress(raw_data, 9)
    
    # Build PNG
    def chunk(chunk_type, data):
        chunk_len = to_bytes(len(data), 4)
        chunk_crc = to_bytes(zlib.crc32(chunk_type + data) & 0xffffffff, 4)
        return chunk_len + chunk_type + data + chunk_crc
    
    # PNG signature
    png = b'\x89PNG\r\n\x1a\n'
    
    # IHDR chunk
    ihdr_data = to_bytes(width, 4) + to_bytes(height, 4) + b'\x08\x06\x00\x00\x00'
    png += chunk(b'IHDR', ihdr_data)
    
    # IDAT chunk
    png += chunk(b'IDAT', compressed)
    
    # IEND chunk
    png += chunk(b'IEND', b'')
    
    return png

# Generate icons
sizes = [72, 96, 128, 144, 152, 192, 384, 512]
for size in sizes:
    png_data = create_png(size, size)
    with open(f'/home/claude/sleep-calculator/icons/icon-{size}.png', 'wb') as f:
        f.write(png_data)
    print(f'Created icon-{size}.png ({len(png_data)} bytes)')

print('All icons created!')
PYTHON
