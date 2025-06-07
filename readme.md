# FreeBASIC SHA2 Implementation

This project is an implementation of the SHA2 hashing algorithm (specifically SHA256) written in FreeBASIC. The core cryptographic operations are implemented in x86 assembly language for performance.

Tested on windows x86(32b) freebasic v0.23.0

latest updates:
*   Populated and structured the README.md with detailed project information (2025-06-07).

## Features

*   Implements the SHA256 hashing algorithm.
*   Core cryptographic logic written in x86 assembly language for optimal performance within FreeBASIC.
*   Includes a `ROR` (rotate right) utility function essential for SHA2 calculations.
*   The main program demonstrates a 2-stage hashing process, where the output of the first hash is used as input for the second.
*   Prints intermediate and final hash values to the console for verification.

## Getting Started

### Prerequisites

*   **FreeBASIC Compiler:** You'll need the FreeBASIC compiler installed. This project was tested with FreeBASIC v0.23.0 on Windows x86 (32-bit). You can download FreeBASIC from [https://www.freebasic.net/](https://www.freebasic.net/).

### Compilation

1.  Open your command-line interface (e.g., Command Prompt on Windows).
2.  Navigate to the directory where you've saved the project files (`SHA2_BASIC.bas`, `SHA2_CPU.bas`, `FUNCTIONS.BAS`).
3.  Compile the main program using the FreeBASIC compiler:
    ```bash
    fbc SHA2_BASIC.bas
    ```
    This will generate an executable file (e.g., `SHA2_BASIC.exe` on Windows).

## Usage

After successful compilation, you can run the program from your command-line interface:

```bash
SHA2_BASIC
```
(Or `SHA2_BASIC.exe` on Windows)

The program will then execute the SHA256 hashing algorithm.

**Current Behavior:**

*   **Hardcoded Input:** The current version of the program uses a hardcoded input string for hashing. This string, `"000187a287320b1a1426674f2fa722ce"`, is defined within the `SHA2_CPU.BAS` file.
*   **Console Output:** The program prints the following to the console:
    *   The input message (in HEX and BIN).
    *   Initial hash values for each stage.
    *   The final SHA256 hash result for each stage.

To hash a different message, you would currently need to modify the `M_S` string variable within the `SHA2_CPU.BAS` file and recompile the program.

## Contributing

Contributions to enhance this project are welcome! If you have ideas for improvements, new features (like dynamic input), or bug fixes, please feel free to:

1.  Fork the repository.
2.  Create a new branch for your changes.
3.  Make your modifications.
4.  Submit a pull request for review.

## License

This project does not currently have a license.

It is recommended to add an open-source license (e.g., MIT, Apache 2.0, GPL) to define how others can use, modify, and distribute the code. If you are the project owner, please consider adding a `LICENSE` file to the repository and stating the chosen license here.
