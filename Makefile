.SILENT:

.default: all

all: clean check distcheck
	echo "All..."
	echo "Done!"

clean:
	echo "Cleaning up..."
	echo "Done!"

check:
	echo "Checking..."
	echo "Done!"

distcheck:
	echo "Distchecking..."
	echo "Done!"
