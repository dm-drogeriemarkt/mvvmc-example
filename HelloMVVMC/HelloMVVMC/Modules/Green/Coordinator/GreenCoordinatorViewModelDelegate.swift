protocol GreenCoordinatorViewModelDelegate: class { // class bound since references to delegates should be weak
    func navigateToRed(withParameter parameter: String)
}
