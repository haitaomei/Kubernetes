# Encfs

        mkdir -p ~/encrypted
        mkdir -p ~/decrypted

        encfs ~/encrypted ~/decrypted

        df -h

        fusermount -u ~/decrypted

        encfs ~/encrypted ~/decrypted

