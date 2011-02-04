@m5
Feature: Sign out

  # Before logout, store in session the logout page (which will become login page after logout)
  Scenario: If session is still there, just redirect to stored page when site is accessed