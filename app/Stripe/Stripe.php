<?php
  namespace App\Stripe;

  use \Stripe\Plan;

  class Stripe
  {
    protected $plan;

    public function __construct()
    {
        \Stripe\Stripe::setApiKey(config('app.stripe_secret'));
        $this->plan = new Plan;
    }

  }
