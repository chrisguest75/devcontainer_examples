import { test, expect } from '@playwright/test';

test('has title', async ({ page }) => {
  await page.goto('https://search.nixos.org/packages');

  const search = page.locator('#search-query-input')
  await search.pressSequentially('Hello World!');
  await search.press('Enter');

  // Expect a title "to contain" a substring.
  await expect(page).toHaveTitle(/NixOS/);

  
});
