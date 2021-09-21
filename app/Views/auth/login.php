<?= $this->extend('auth/templates/index'); ?>

<?= $this->section('content'); ?>

<div class="cover-container d-flex h-100 p-3 mx-auto flex-column">
    <header class="masthead mb-auto" style="opacity: 0;">
        <div class="inner">
        <h3 class="masthead-brand">Cover</h3>
        </div>
    </header>

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-md-6">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <!-- <div class="col-lg-6 d-none d-lg-block bg-login-image"></div> -->
                            <div class="col-lg">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4"><?=lang('Auth.loginTitle')?></h1>
                                    </div>
                                    <?= view('Myth\Auth\Views\_message_block') ?>

                                    <form action="<?= route_to('login') ?>" method="post" class="user">
                                        <?= csrf_field() ?>

                                        <?php if ($config->validFields === ['email']): ?>
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user <?php if(session('errors.login')) : ?>is-invalid<?php endif ?>"
                                            name="login" placeholder="<?=lang('Auth.email')?>">
                                            <div class="invalid-feedback">
                                                <?= session('errors.login') ?>
                                            </div>
                                        </div>
                                        <?php else: ?>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user <?php if(session('errors.login')) : ?>is-invalid<?php endif ?>"
                                            name="login" placeholder="<?=lang('Auth.emailOrUsername')?>">
                                            <div class="invalid-feedback">
                                                <?= session('errors.login') ?>
                                            </div>
                                            </div>
                                        <?php endif; ?>
                                        <div class="form-group">
                                        <input type="password" name="password" class="form-control form-control-user  <?php if(session('errors.password')) : ?>is-invalid<?php endif ?>" placeholder="<?=lang('Auth.password')?>">
                                            <div class="invalid-feedback">
                                                <?= session('errors.password') ?>
                                            </div>
                                        </div>

                                        <?php if ($config->allowRemembering): ?>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input type="checkbox" name="remember" class="form-check-input" <?php if(old('remember')) : ?> checked <?php endif ?>>
                                                <?=lang('Auth.rememberMe')?>
                                            </label>
                                        </div>
                                        <?php endif; ?>
                                        <br>
                                        <button type="submit" class="btn btn-primary btn-user btn-block"><?=lang('Auth.loginAction')?></button>
                                    </form>

                                    <hr>
                                    <a class="btn btn-primary btn-block" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                                        Contoh Admin
                                    </a>
                                    <div class="collapse" id="collapseExample">
                                        <div class="card card-body">
                                            Username : starter12345 <br>
                                            Email : user@gmail.com <br>
                                            Password : starter12345
                                        </div>
                                    </div>
                                    <!-- Footer -->
                                    <footer class="sticky-footer bg-white mt-5">
                                        <div class="container my-auto">
                                            <div class="copyright text-center my-auto">
                                                <span>Copyright &copy; pi.haafidz.xyz <?= date('Y') ?></span>
                                            </div>
                                        </div>
                                    </footer>
                                    <!-- End of Footer -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?= $this->endSection(); ?>
