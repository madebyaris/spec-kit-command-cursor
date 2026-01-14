/**
 * SDD Iterate Hook
 *
 * Continues agent execution for simple iteration loops:
 * - Run tests until pass
 * - Iterate on UI until matches design
 * - Fix linter errors until clean
 *
 * Requires Cursor 2.3+ and Bun runtime
 */

import { readFileSync, existsSync } from "fs";

interface StopHookInput {
  conversation_id: string;
  status: "completed" | "aborted" | "error";
  loop_count: number;
}

const MAX_ITERATIONS = 10;
const SCRATCHPAD_PATH = ".cursor/scratchpad.md";

async function main(): Promise<void> {
  try {
    // Read input from stdin (Cursor passes hook context as JSON)
    const input: StopHookInput = await Bun.stdin.json();

    // Don't continue if aborted, errored, or max iterations reached
    if (input.status !== "completed" || input.loop_count >= MAX_ITERATIONS) {
      console.log(JSON.stringify({}));
      return;
    }

    // Check scratchpad for completion signal
    const scratchpad = existsSync(SCRATCHPAD_PATH)
      ? readFileSync(SCRATCHPAD_PATH, "utf-8")
      : "";

    // Stop conditions - look for success markers
    const stopMarkers = [
      "DONE",
      "COMPLETE",
      "ALL TESTS PASS",
      "NO ERRORS",
      "ITERATION COMPLETE",
    ];

    const shouldStop = stopMarkers.some((marker) =>
      scratchpad.toUpperCase().includes(marker)
    );

    if (shouldStop) {
      // Stop iteration
      console.log(JSON.stringify({}));
    } else {
      // Continue iteration with followup message
      console.log(
        JSON.stringify({
          followup_message: `[Iteration ${input.loop_count + 1}/${MAX_ITERATIONS}] Continue working. Update ${SCRATCHPAD_PATH} with DONE when complete.`,
        })
      );
    }
  } catch (error) {
    // On error, stop iteration gracefully
    console.error("Hook error:", error);
    console.log(JSON.stringify({}));
  }
}

main();
